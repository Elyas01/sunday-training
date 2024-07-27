public with sharing class RestCalloutsMock implements HttpCalloutMock{
   public HttpResponse respond(HttpRequest request){

    if (request.getMethod() == 'GET' && request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals') {
        HttpResponse response = new HttpResponse();
        response.setStatus('OK');
        response.setStatusCode(200);
        response.setBody('{"animals" : ["majestic badger","fluffy bunny]}');
        return response;
    }else  if (request.getMethod() == 'GET' && request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/blogs') {
        HttpResponse response = new HttpResponse();
        response.setStatus('OK');
        response.setStatusCode(200);
        string jsonstring='[{"id":118196,"user_id":6850165,"title":"Ut .","body":" Cumque venio quod. Thorax est volo."}]';
        response.setBody(jsonstring); //hence we get bigger data in get ;
        return response;
    } else if (request.getMethod() == 'GET' && request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/products') {
        HttpResponse response = new HttpResponse();
        response.setStatus('OK');
        response.setStatusCode(200);
        string jsonstring='[{"id":118196,"user_id":6850165,"title":"Ut .","body":" Cumque venio quod. Thorax est volo."}]';
        response.setBody(jsonstring); //hence we get bigger data in get ;
        return response;
    } else if (request.getMethod() == 'POST' && request.getEndpoint()=='https://th-apex-http-callout.herokuapp.com/aaa'){
        HttpResponse response = new HttpResponse();
        response.setStatus('Created');
        response.setStatusCode(201);
        return response;
    }else if (request.getMethod() == 'POST' && request.getEndpoint()=='https://th-apex-http-callout.herokuapp.com/bbb'){
        HttpResponse response = new HttpResponse();
        response.setStatus('Created');
        response.setStatusCode(201);
        return response;
    }
    return null;
   }
}