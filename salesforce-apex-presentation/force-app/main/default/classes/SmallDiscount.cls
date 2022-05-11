public with sharing class SmallDiscount implements Discount {
    public Decimal calculateDiscount(Decimal oppAmount) {
        return oppAmount - oppAmount*.025;
    }
}
