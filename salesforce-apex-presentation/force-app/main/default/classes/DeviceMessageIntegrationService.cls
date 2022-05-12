@restResource(urlMapping='/DeviceMessageIntegration/*')
global with sharing class DeviceMessageIntegrationService {
    
    @HttpPost
    global static void createDeviceMessage() {
        RestRequest req = RestContext.request;
        String requestBody = req.requestBody.toString();
        
        List<DeviceMessageInput> messages;
        messages = (List<DeviceMessageInput>) JSON.deserialize(requestBody,List<DeviceMessageInput>.class);      

        DeviceMessageService.createDeviceMessages(messages);


    }
    
}
