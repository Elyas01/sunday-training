public with sharing class RestCallouts {

    public static HttpResponse getAnimals(){
        //1.Prepare HTTPREquest and wap the necessary information
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        Request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        //2.prepare internet 
        Http http = new http();
        //3.send the request over the internet to receive response
        HttpResponse response = http.send(request);
        //4.process the response
        if(response.getStatusCode() == 200){
            System.debug(response.getStatus());
            system.debug(response.getBody());
        }
        return response;
    }
    public static HttpResponse getBlogs(){
        //1.Prepare HTTPREquest and wrap the necessary information
        HttpRequest request= new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/blogs');

         //2.prepare internet 
         Http http =new Http();

         //3.send the request over the internet to receive response
         HttpResponse response = Http.send(request);
         
         //4.process the response
         if(response.getStatusCode() == 200){
            system.debug(response.getBody());
            string jsonString= response.getBody();
            //Convert the json string into apexType 
            List<BlogWrapper> wrappers =(List<BlogWrapper>)JSON.deserialize(jsonString, List<BlogWrapper>.class);

            //Convert the blog wrappers into blog sObjects
            List<Blog__c> blogs= new List<Blog__c>();
            for (BlogWrapper bw: wrappers) {
                Blog__c blog= new Blog__c();
                blog.Topic__c=bw.topic;
                blog.Author__c=bw.author;
                blog.Title__c=bw.title;
                blog.Body__c=bw.body;
                blogs.add(blog);
            }
                try {
                    Insert blogs;
                } catch (Exception ex) {
                    system.debug(ex.getMessage());   
                  }
            
        }

         return response;
    }
    public static HttpResponse getProducts(){
         //1.Prepare HTTPREquest and wrap the necessary information
         HttpRequest request = new HttpRequest();
         request.setMethod('GET');
         request.setEndpoint('https://th-apex-http-callout.herokuapp.com/products');//where do you wanna go and what you gonna do there
         //2.prepare internet
        Http http =new Http();
         //3.send the request over the internet to receive response
         HttpResponse response = http.send(request);
         //4.process the response
         if (response.getStatusCode()==200) {
            system.debug(response.getBody());

            //convert the json string into apex type
            string jsonString=response.getBody();
            List<ProductWrapper> wrappers=(List<ProductWrapper>)JSON.deserialize(jsonString, List<ProductWrapper>.class);

            List<Ecommerce_Products__c> products = new List<Ecommerce_Products__c>();
            for (ProductWrapper Pw : wrappers) {
                Ecommerce_Products__c prod= new Ecommerce_Products__c();
                prod.Product_Name__c=pw.Name;
                prod.Image__c=pw.image;
                string amount= pw.price.substring(1); // $260.82 = 260.82;
                //amount.substring(1);2
                prod.Price__c = Double.valueOf(amount); // converting string to double (decimal)
                prod.Description__c=pw.description;
                prod.Category__c=pw.category;
                prod.Introduced_Date__c=Date.today();
                prod.name= string.valueOf(pw.productId);
                
                
                
                products.add(prod);
            }
            try {
                insert products;
            } catch (Exception ex) {
                system.debug(ex.getMessage());
            }
            
         }
       return response;
    }
    // Post Method
        Public static HttpResponse postAnimal(){

            //1.Prepare HTTPREquest and wrap the necessary information
            HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            string jsonString = '{"name" : "dog"}';
            request.setBody(jsonString);
            request.setHeader('Content-Type', 'application/json');
            //2.prepare internet
            Http http = new http();

            //3.send the request over the internet to receive response
            HttpResponse response= http.send(request);
            system.debug(response);

            //4.process the response
            if(response.getStatusCode()==201){
                system.debug('Animal has been posted successfully');
            }
            return response;
    }
    // HomeWork Done!
    public static HttpResponse getContacts(){
        //1.Prepare HTTPREquest and wrap the necessary information
        HttpRequest request= new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('endpoint');// Where Do you wanna go and waht do you wanna do
        //2.prepare internet
        Http http= new Http();
        //3.send the request over the internet to receive response
        HttpResponse response =http.send(request);
        //4.process the response  Json => wrapper => Sobjsect
        if (response.getStatusCode()==200) {
            string jsonString=response.getBody();
           List<ContactWrapper> wrappers= (List<contactWrapper>)json.deserialize(jsonString, List<ContactWrapper>.class);
           List<Contact> contacts= new List<contact>();
           for (ContactWrapper cw : wrappers) {
            Contact cont = new Contact();
            cont.FirstName=cw.name;
            cont.email= cw.email;
            
            contacts.add(cont);

           }
           try {
            insert contacts;
           } catch (Exception ex) {
            system.debug(ex.getMessage());
           }
        }
        return response;
    }

    //7215752bc113fc44c716243fa96fc9ea9fe0f39ed2ec526bd269e1094118d6d0
    //https://gorest.co.in/public/v2/users
    public static HttpResponse postGorestContact(){
        //1.Prepare HTTPREquest and wrap the necessary information   - sObject => wrapper => json.serilize
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        //1.1 Get the gorest contact records and prepare them into json string
        Gorest_Contact__c con= [SELECT Id, Name, Email__c, gender__c, Status__c FROM Gorest_Contact__c limit 1];
        List<GorestContactWrapper> wrapper= new List<GorestContactWrapper>();
       // for (Gorest_Contact__c con : contacts) {
            GorestContactWrapper wrap = new GorestContactWrapper();
            wrap.name=con.Name;
            wrap.email=con.Email__c;
            wrap.gender=con.gender__c;
            wrap.status=con.Status__c;
            
           // wrapper.add(wrap); // converted to wrapper
      //  }
       string jsonstring= JSON.serialize(wrapper);
       request.setBody(jsonstring);
       request.setHeader('Content-Type', 'application/json;charset=UTF-8');
         request.setHeader('Authorization1', 'Bearer 215752bc113fc44c716243fa96fc9ea9fe0f39ed2ec526bd269e1094118d6d0');
        //2.prepare internet
        Http http = new Http();
        //3.send the request over the internet to receive response
        HttpResponse response= http.send(request);
        system.debug(response.getBody());
        System.debug(response);
        //4.process the response
        if (response.getStatusCode()==201) {
            system.debug('records have been created successfully!');
        }
        return response;
    }

    public static HttpResponse deleteGoRest(){
        //1.Prepare HTTPREquest and wrap the necessary information   - sObject => wrapper => json.serilize
        //7215752bc113fc44c716243fa96fc9ea9fe0f39ed2ec526bd269e1094118d6d0
        HttpRequest request = new HttpRequest();
        request.setMethod('DELETE');
        request.setEndpoint('https://gorest.co.in/public/v2/todos');

        Gorest_Contact__c con=[SELECT id,name, status__c, Title__c, Due_on__c FROM Gorest_Contact__c where name = 'Mustang' limit 1];
        List<DeleteWrapper> wrapper= new List<DeleteWrapper>();
        DeleteWrapper dw= new DeleteWrapper();
        dw.due_on=con.name;
        dw.status=con.Status__c;
        dw.title=con.title__c;
        dw.user_Id=con.Id;

       string jsonstring=JSON.serialize(wrapper);
       request.setBody(jsonstring);
       request.setHeader('Content-Type', 'application/json;charset=UTF-8');
       request.setHeader('Authorization', 'Bearer 7215752bc113fc44c716243fa96fc9ea9fe0f39ed2ec526bd269e1094118d6d0');
        
       //2.prepare internet
       Http http =new Http();

       //3.send the request over the internet to receive response
       HttpResponse response=http.send(request);
       system.debug(response.getBody());
        System.debug(response);

        //4.process the response
        if (response.getStatusCode()==201) {
            system.debug('records have been created successfully!');
        }

        return response;

    }
}