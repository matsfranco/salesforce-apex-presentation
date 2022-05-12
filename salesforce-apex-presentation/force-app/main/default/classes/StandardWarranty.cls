public virtual class StandardWarranty {
    
    public List<String> products;
    public Integer months;
    public Boolean isActive;
    public String status;
    public Date startDate;
    public Date endDate; 
    
    public StandardWarranty() {
        months = 12;
        createProductList();
        status = 'new';
        isActive = false;
        System.debug('Nova Std Warranty criada!');
    }

    public virtual void createProductList() {
        products = new List<String>();
        products.add('STD product 1');
        products.add('STD product 2');
    }

    public void renew() {
        if(status != 'new') {
            activate();
            System.debug('Contrato renovado');
        } else {
            System.debug('Não renovado. Status precisa ser diferente de new');
        }
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

    public String getData() {
        return   'Status: '+status+' Start Date: '+startDate+' End Date: '+endDate+' Products: '+products;
    }
    

}
