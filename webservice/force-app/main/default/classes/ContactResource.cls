@RestResource(urlMapping='/contacts/*')
global class ContactResource {
    @HttpPost
    global static ContactService.ContactResponse createContact(){               
        String body = RestContext.request.requestBody.toString();           
        Contact c = (Contact)JSON.deserialize(body,Contact.class);
        return ContactService.createContact(c);       
    }                

    @HttpGet
    global static ContactService.ContactResponse getContact(){
        Id contactId = RestContext.request.params.get('Id');
        return ContactService.getContact(contactId);         
    }

    @HttpDelete
    global static ContactService.ContactResponse deleteContact(){
        Id contactId = RestContext.request.params.get('Id');    
        return ContactService.deleteContact(contactId);    
    }

    @HttpPatch
    global static ContactService.ContactResponse updateContact(){    
        RestRequest request = RestContext.request;
        Id contactId = request.params.get('Id'); 
        String body = request.requestBody.toString();        
        Contact c = (Contact)JSON.deserialize(body,Contact.class);        
        return ContactService.updateContact(contactId, c);
    }    

}
