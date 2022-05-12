@restResource(urlMapping='/DeviceMessageIntegration/*')
global with sharing class DeviceMessageIntegrationService {
    
    @HttpPost
    global static void createDeviceMessage() {
        RestRequest req = RestContext.request;
        String requestBody = req.requestBody.toString();
        
        List<DeviceMessageInput> messages;
        messages = (List<DeviceMessageInput>) JSON.deserialize(requestBody,List<DeviceMessageInput>.class);      

        System.debug(messages);
        /*
        
        HttpRequest req = new HttpRequest();
        
        
        DeviceMessageInput message = new DeviceMessageInput(messageType,code,messageBody,source,priority,serialNumber,messageDateTime);
        //message = (DeviceMessageInput) JSON.deserialize(req.getBody,DeviceMessageInput.class);        
        System.debug(message);
        */
    }
    
}
