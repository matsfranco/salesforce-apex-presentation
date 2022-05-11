public with sharing class StandardDiscount implements Discount{
    
    public Decimal calculateDiscount(Decimal oppAmount) {
        return oppAmount - oppAmount*.05;
    }

}
