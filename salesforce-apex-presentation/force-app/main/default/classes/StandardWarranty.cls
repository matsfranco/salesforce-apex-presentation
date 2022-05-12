public abstract class StandardWarranty {
    
    public List<String> products;
    public Integer months;
    public Boolean isActive;
    public String status;
    public Date startDate;
    public Date endDate; 
    

    public void createProductList() {
        products = new List<String>();
        products.add('STD product 1');
        products.add('STD product 2');
        products.add('STD product 3');
    }

    public void renew() {
        activate();
        System.debug('Contrato renovado');
    }

    public void block() {
        this.status = 'blocked';
        this.isActive = false;
    }

    public void unblock() {
        this.status = 'active';
        this.isActive = true;
    }

    public void expire() {
        this.status = 'expired';
        this.isActive = false;
    }

    public void activate() {
        this.status = 'active';
        this.isActive = true;
        createProductList();
        this.startDate = Date.today();
        this.endDate = Date.today().addMonths(months);
    }

    public void updateStatus(Date d) {
        if(d > endDate) {
            expire();
        }
    }
    
}
