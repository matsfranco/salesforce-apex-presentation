public with sharing class DiscountFactory {
    
    public static Discount getDiscount(Decimal amount) {
        if(amount >= 1000.00) {
            return new BigDiscount();
        } else if(amount >= 500.00 ){
            return new StandardDiscount();
        } else {
            return new SmallDiscount();
        }
    }
}
