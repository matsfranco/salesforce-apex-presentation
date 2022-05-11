@isTest
public with sharing class DiscountCalculatorTest {
    
    @isTest
    public static void testStandardDiscount() {
        Opportunity opp = new Opportunity();
        opp.Amount = 1000.00;
        DiscountCalculator calculator = new DiscountCalculator(opp);
        test.startTest();
        Decimal result = calculator.discountOpportunity();
        test.stopTest();
        System.assertEquals(opp.Amount*(1-0.10), result, 'Should return 10%');
    }

    @isTest
    public static void testSmallDiscount() {
        Opportunity opp = new Opportunity();
        opp.Amount = 500.00;
        DiscountCalculator calculator = new DiscountCalculator(opp);
        test.startTest();
        Decimal result = calculator.discountOpportunity();
        test.stopTest();
        System.assertEquals(opp.Amount*(1-0.05), result, 'Should return 5%');
    }

    @isTest
    public static void testBigDiscount() {
        Opportunity opp = new Opportunity();
        opp.Amount = 100.00;
        DiscountCalculator calculator = new DiscountCalculator(opp);
        test.startTest();
        Decimal result = calculator.discountOpportunity();
        test.stopTest();
        System.assertEquals(opp.Amount*(1-0.025), result, 'Should return 2.5%');
    }
}
