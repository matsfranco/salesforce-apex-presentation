public class DeviceMessageInput {
    public String messageType;
    public String deviceSerialNumber;
    public String messageBody;
    public String code;
    public String source;
    public String priority;
    public Datetime messageDateTime;
    
    public DeviceMessageInput(String messageType, String code, String messageBody, String source, String priority, String serialNumber, DateTime messageDateTime) {
        this.messageType = messageType;
        this.code = code;
        this.messageBody = messageBody;
        this.source = source;
        this.priority = priority;
        this.deviceSerialNumber = serialNumber;
        this.messageDateTime = messageDateTime;
    }
    
}