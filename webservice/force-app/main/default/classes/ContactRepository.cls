public with sharing class ContactRepository {
    
    public static Contact getContactById(Id contactId){
        Contact contact = [SELECT AccountId, FirstName, LastName, Email, Phone, Id FROM Contact WHERE Id =: contactId];
        return contact;
    }

    public static void insertContact(Contact contact){
        insert contact;
    }

    public static void deleteContact(Id contactId){
        Contact contactDelete = getContactById(contactId);    
        delete contactDelete;    
    }

    public static Contact updateContact(Id contactId, Contact newData){
        Contact contactToUpdate = getContactById(contactId); 
        contactToUpdate.AccountId = newData.AccountId;
        contactToUpdate.FirstName = newData.FirstName;
        contactToUpdate.LastName = newData.LastName;
        contactToUpdate.Email = newData.Email;
        contactToUpdate.Phone = newData.Phone;        
        update contactToUpdate;      
        return contactToUpdate;  
    }

}
