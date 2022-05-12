@isTest
public class DeviceMessageInputTest {
	
    @isTest
    public static void createDeviceMessage() {
    	DeviceMessageInput newMessage = new DeviceMessageInput('ext_msg_id','test','120','test message','test class','low','',DateTime.now());
    	System.assertEquals(newMessage.messageType,'test','Problems to create a simple DeviceMessageInput');
    }
    
}