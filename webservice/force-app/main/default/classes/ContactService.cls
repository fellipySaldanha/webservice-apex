global with sharing class ContactService {
    
    private static final String NOT_FOUND =  'Error! Contact not found';
    private static final String SUCCESS = 'Success!';
    private static final String INCOMPLETE_DATA = 'Error: Data incomplete!';
    private static ContactResponse response = new ContactResponse();
    private static RestResponse restStatus = RestContext.response;


    public static ContactResponse createContact(Contact contact){        

        try {        
            ContactRepository.insertContact(contact);
            restStatus.statusCode = 200;            
            response.message = SUCCESS;
            response.contact = contact;         
        } catch (Exception e) {                   
            restStatus.statusCode = 400;            
            response.message = INCOMPLETE_DATA;                                
        }                    
        return response;        
    }
    
    public static ContactResponse getContact(Id contactId){      

        try {
            Contact contact = ContactRepository.getContactById(contactId);
            response.message = SUCCESS;
            response.contact = contact; 
            restStatus.statusCode = 200;            
        } catch (Exception e) {
            restStatus.statusCode = 400;
            response.message = NOT_FOUND;             
        }
        return response;                    
    }

    public static ContactResponse deleteContact(Id idContact){  

        try {
            ContactRepository.deleteContact(idContact);           
            response.message = SUCCESS;
            restStatus.statusCode = 200;            
        } catch (Exception e) {
            restStatus.statusCode = 400;
            response.message = NOT_FOUND;  
        }
            return response;                     
    }

    public static ContactResponse updateContact(Id contactId, Contact contactBody){
        
        try {
            ContactRepository.updateContact(contactId, contactBody);            
            restStatus.statusCode = 200;            
            response.message = SUCCESS;
        } catch (Exception e) {            
            restStatus.statusCode = 400; 
            response.message = NOT_FOUND;
        }
        return response;
    }

    global class ContactResponse{        
        public String message;   
        public Contact contact;     
    }

}
