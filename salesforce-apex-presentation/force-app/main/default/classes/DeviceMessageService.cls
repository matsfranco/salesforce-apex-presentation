public class DeviceMessageService {
    
    public static Device__c findDeviceBySerialNumber(String serialNumber) {
        List<Device__c> devices = [SELECT Id,Name,Owner__c,Product__c FROM Device__c WHERE SerialNumber__c =: serialNumber];
        if(!devices.isEmpty()) {
            return devices[0];
        } else {
        	return null; 
        }
    }
    
    public static DeviceMessage__c createNewDeviceMessage(DeviceMessageInput message) {
		DeviceMessage__c newDeviceMessage = new DeviceMessage__c();
        newDeviceMessage.Name = message.deviceSerialNumber + '/' + message.code;
        newDeviceMessage.DeviceSerialNumber__c = message.deviceSerialNumber;
        newDeviceMessage.Body__c = message.messageBody;
        newDeviceMessage.Source__c = message.source;
        newDeviceMessage.Priority__c = message.priority;        
        newDeviceMessage.Code__c = message.code;
        newDeviceMessage.Type__c = message.messageType;
        newDeviceMessage.DateTime__c = message.messageDateTime;
     	newDeviceMessage.Device__c = findDeviceBySerialNumber(message.deviceSerialNumber).Id;
        database.insert(newDeviceMessage);
        
        return newDeviceMessage;
    }
    
    
}