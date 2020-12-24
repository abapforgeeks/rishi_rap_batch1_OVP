sap.ui.define(["sap/ui/core/util/MockServer"],function(e){"use strict";var t,a="ovpv1/";return{init:function(){var r=jQuery.sap.getUriParameters(),n=jQuery.sap.getModulePath(a+"manifest",".json"),s="",i=r.get("errorType"),o=i==="badRequest"?400:500,u=jQu+
ery.sap.syncGetJSON(n).data,p=u["sap.app"].dataSources;for(var l in p){if(p.hasOwnProperty(l)){var c=p[l],f=jQuery.sap.getModulePath(a+c.settings.localUri.replace(".xml",""),".xml"),d=f.slice(0,f.lastIndexOf("/")+1),g=c.settings.localUri;if(c.settings&&c+
.settings.localUri){if(typeof c.type==="undefined"||c.type==="OData"){var y=jQuery.sap.getModulePath(a+c.settings.localUri.replace(".xml",""),".xml");t=new e({rootUri:/.*\/$/.test(c.uri)?c.uri:c.uri+"/"});t.simulate(y,{sMockdataBaseUrl:d,bGenerateMissing+
MockData:true});t.start()}}var h=c.settings.annotations||[];h.forEach(function(t){var r=p[t];var n=r.uri,s=jQuery.sap.getModulePath(a+r.settings.localUri.replace(".xml",""),".xml");new e({rootUri:n,requests:[{method:"GET",path:new RegExp(""),response:fun+
ction(e){var t=jQuery.sap.sjax({url:s,dataType:"xml"}).data;e.respondXML(200,{},jQuery.sap.serializeXML(t));return true}}]}).start()})}}e.config({autoRespond:true,autoRespondAfter:r.get("serverDelay")||1e3});var m=t.getRequests(),v=function(e,t,a){a.resp+
onse=function(a){a.respond(e,{"Content-Type":"text/plain;charset=utf-8"},t)}};if(r.get("metadataError")){m.forEach(function(e){if(e.path.toString().indexOf("$metadata")>-1){v(500,"metadata Error",e)}})}if(i){m.forEach(function(e){if(e.path.toString().ind+
exOf(s)>-1){v(o,i,e)}})}t.start();jQuery.sap.log.info("Running the app with mock data")},getMockServer:function(){return t}}});                                                                                                                                