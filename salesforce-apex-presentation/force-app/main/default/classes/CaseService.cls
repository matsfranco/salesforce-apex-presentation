public with sharing class CaseService {
    public CaseService() {

    }

    public static Boolean shouldCreateCase(String messageType) {
        if(messageType == 'Error' || messageType == 'Warning') {
            return true;
        } else {
            return false;
        }
    }


    public static void createCaseFromDeviceMessages(List<DeviceMessage__c> messages, Map<String,Device__c> serialNumberToDevice) {
        System.debug(messages);
        List<Case> casesToInsert = new List<Case>();
        for(DeviceMessage__c message : messages) {
            Case newCase = new Case();
            Device__c device = serialNumberToDevice.get(message.DeviceSerialNumber__c);
            if(shouldCreateCase(message.Type__c)) {
                newCase.Device__c = message.Device__c;
                newCase.DeviceMessage__c = message.Id;
                newCase.Origin = 'Telemetry';
                newCase.ContactId = device.Owner__c;
                newCase.AccountId = device.Owner__r.AccountId;
                newCase.Priority = message.Priority__c;
                newCase.Type = message.Type__c;
                newCase.Reason = 'Automated Notification';
                newCase.Subject = '[Device Notification] '+device.Name;
                newCase.Description = message.Body__c;
                casesToInsert.add(newCase);
            }
        }
        database.insert(casesToInsert);
    }
}
