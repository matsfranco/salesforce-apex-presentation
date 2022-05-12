public with sharing class PremiumWarranty extends StandardWarranty {
    
    public PremiumWarranty() {
        months = 24;
        createProductList();
        status = 'new';
        isActive = false;
        System.debug('Nova Premium Warranty criada!');
    }

    public override void createProductList() {
        products = new List<String>();
        products.add('STD product 1');
        products.add('STD product 2');
        products.add('PREMIUM product 1');
        products.add('PREMIUM product 2');
    }

    public void addNewProduct(String productName) {
        this.products.add(productName);
    }

}
