public with sharing class BigDiscount implements Discount{
    
    public Decimal calculateDiscount(Decimal oppAmount) {
        return oppAmount - oppAmount*.10;
    }

}
