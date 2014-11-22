'use strict';

//var phantomjs = require("phantomjs");
//var browser = require('zombie');//zombie-phantom

var fs = require('fs');
var request = require("request");
var cheerio = require("cheerio");

var events = require('events');
var CupidoEvents = new events.EventEmitter();
CupidoEvents.ProgressRequest = "ProgressRequest";
CupidoEvents.AllRequestFinish = "AllRequestFinish";


var MAX_CHAR_TEXT = 120;
var CupidoMessages = CupidoMessages || {};
CupidoMessages.totRequest = 0;
CupidoMessages.currentRequest = 0;
CupidoMessages.frases = [];

CupidoMessages.init = function(){
  console.log("--- Grab Messages Ready ---");

  //***** Grab Messages from  www.pensieriparole.it *****
  //CupidoMessages.pensieriparole();

  //***** Grab Messages from aforismi.meglio.it *****
  //CupidoMessages.aforismimeglio();

};


CupidoMessages.pensieriparole = function(){
  var baseUri = "http://www.pensieriparole.it/aforismi/amore/pag";
  console.log("--- Grab Messages from www.pensieriparole.it ---");

  for(var i = 3951; i >= 1951; i--) {
    CupidoMessages.request("pensieriparole", baseUri + i);
  }

  CupidoEvents.on(CupidoEvents.ProgressRequest, function(perc){
    //console.log("CupidoEvents.ProgressRequest", perc+"%");
    process.stdout.write("--- Grab Process " + perc + "% complete... ---" + "\x1B[0G");
  });

  CupidoEvents.on(CupidoEvents.AllRequestFinish, function(){
    console.log(""); console.log("--- Grab Process completed ---");  
    CupidoMessages.saveToFile(CupidoMessages.typeSite+".json");
  }); 

};

CupidoMessages.aforismimeglio = function(){
  var baseUri = "http://aforismi.meglio.it/frasi-amore.htm";
  console.log("--- Grab Messages from aforismi.meglio.it ---");

  CupidoMessages.request("aforismimeglio", baseUri);  

  CupidoEvents.on(CupidoEvents.ProgressRequest, function(perc){
    //console.log("CupidoEvents.ProgressRequest", perc+"%");
    process.stdout.write("--- Grab Process " + perc + "% complete... ---" + "\x1B[0G");
  });

  CupidoEvents.on(CupidoEvents.AllRequestFinish, function(){
    console.log(""); console.log("--- Grab Process completed ---");  
    CupidoMessages.saveToFile(CupidoMessages.typeSite+".json");
  });

};

CupidoMessages.request = function(type, uri){
  //console.log("CupidoMessages.request", uri);
  CupidoMessages.typeSite = type;
  CupidoMessages.currentRequest = CupidoMessages.totRequest++;
  request({ uri: uri, encoding: "binary"}, CupidoMessages.requestComplete);
};

CupidoMessages.requestComplete = function(error, response, body){
  if(!error && response.statusCode == 200) {
    var $ = cheerio.load(body);

    switch(CupidoMessages.typeSite){
      case "pensieriparole":

        $(".phrase").each(function() {
          var text = $(this).find("blockquote").text();
          var author = $(this).find(".author .value").text();
          if(text.length <= MAX_CHAR_TEXT) CupidoMessages.frases.push({ "text": text, "author": author });
        });        

        break;
      case "aforismimeglio":          

        $("#afolist li:not(.padb)").each(function() {
          var text = $(this).find(".afomain a").text();
          var author = $(this).find(".autore a").text();
          if(text.length <= MAX_CHAR_TEXT) CupidoMessages.frases.push({ "text": text, "author": author });
        });

        break;
      case "altrosito":  

        break;
    }
        
    var percRequest = Math.abs(Math.round(CupidoMessages.currentRequest / CupidoMessages.totRequest * 100) - 100);
    CupidoEvents.emit(CupidoEvents.ProgressRequest, percRequest);
          
    if(CupidoMessages.currentRequest == 0) {
       CupidoEvents.emit(CupidoEvents.AllRequestFinish);
    } else {
      CupidoMessages.currentRequest--;
    }    
  
  } else {
    console.log("CupidoMessages.requestComplete ERROR: ", error);
    CupidoMessages.currentRequest--;
  }
};

CupidoMessages.saveToFile = function(name){
  if(CupidoMessages.frases.length == 0) return;
  if(!name) name = "frases.json";

  //console.log("CupidoMessages.saveToFile", name, CupidoMessages.frases.length);

  var body = JSON.stringify(CupidoMessages.frases , null, 4);
  fs.writeFile(name, body, { 'encoding': 'binary' }, function(error) {
      if(!error) {
        console.log("--- Saved file named "+name+" ---");          
      } else {
        console.log("CupidoMessages.saveToFile ERROR: ", error);
      }
  });
};

CupidoMessages.init();