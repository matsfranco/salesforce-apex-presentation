@isTest
public class DeviceMessageServiceTest {
	
    @testSetup
    public static void makeData() {
		List<Contact> contactsToCreate = new List<Contact>();
        Contact c1 = new Contact(LastName = '1',FirstName = 'Contact');
        contactsToCreate.add(c1);
        Contact c2 = new Contact(LastName = '1',FirstName = 'Contact');
        contactsToCreate.add(c2);
		
        database.insert(contactsToCreate);
        
        Product2 productToCreate = new Product2(Name = 'Test Product', ProductCode = '0502');
        database.insert(productToCreate);

        List<Device__c> sampleDevicesToCreate = new List<Device__c>();
        Device__c d1 = new Device__c(Name = productToCreate.Name, Owner__c = contactsToCreate[0].Id, SerialNumber__c = '0502-00001', Product__c = productToCreate.Id);
        sampleDevicesToCreate.add(d1);
        Device__c d2 = new Device__c(Name = productToCreate.Name, Owner__c = contactsToCreate[1].Id, SerialNumber__c = '0502-00002', Product__c = productToCreate.Id);
        sampleDevicesToCreate.add(d2);
        database.insert(sampleDevicesToCreate);
    }
    
    
    @isTest
    public static void testCreateDeviceMessageFromInput() {
        Test.startTest();
        
        DeviceMessageInput deviceMessageInput = new DeviceMessageInput('ext_msg_id','Test','000100','Test from DeviceMessageServiceTest','Apex Test Class','Low','0502-00001',Datetime.now());
    	DeviceMessageService.createDeviceMessage(deviceMessageInput);
        
        List<DeviceMessage__c> messages = [SELECT id,Device__r.SerialNumber__c FROM DeviceMessage__c WHERE Name = '0502-00001/000100'];
        System.assertEquals(messages.size(), 1, 'No Device Message found');
        System.assertEquals(messages[0].Device__r.SerialNumber__c, deviceMessageInput.deviceSerialNumber, 'Problems to find the device record');
        
        Test.stopTest();
    }
    
    @isTest
    public static void testDeviceNotFount() {
       	Test.startTest(); 
        DeviceMessageInput deviceMessageInput = new DeviceMessageInput('ext_msg_id','Test','000100','Test from DeviceMessageServiceTest','Apex Test Class','Low','0502-00003',Datetime.now());
        try {
            DeviceMessageService.createDeviceMessage(deviceMessageInput);
            List<DeviceMessage__c> messages = [SELECT Id FROM DeviceMessage__c];
            System.assertEquals(messages.size(),0,'Device found when it was not expected');
        } catch (Exception e) {
            System.assertEquals(e.getMessage(), 'Attempt to de-reference a null object', 'Unhandled Exception');
        }
        Test.stopTest();
    }
    
    @isTest
    public static void testInvalidType() {
       	Test.startTest(); 
        DeviceMessageInput deviceMessageInput = new DeviceMessageInput('ext_msg_id','Invalid Type','000100','Test from DeviceMessageServiceTest','Apex Test Class','Low','0502-00002',Datetime.now());
        try {
            DeviceMessageService.createDeviceMessage(deviceMessageInput);
            List<DeviceMessage__c> messages = [SELECT Id FROM DeviceMessage__c];
            System.assertEquals(messages.size(),0,'A Device Message was created with an invalid Picklist value');
        } catch (Exception e) {
            System.assertEquals(e.getMessage().contains('bad value for restricted picklist field'), true, 'Unhandled Exception');
        }
        Test.stopTest();
    }
    
}