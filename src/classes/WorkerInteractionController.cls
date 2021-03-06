public class WorkerInteractionController {
	public String roleValue;
	public String worker;
	public List<Interaction__c> interactions { get; set; }

	public WorkerInteractionController() {
		roleValue = ApexPages.currentPage().getParameters().get('role');
		worker = ApexPages.currentPage().getParameters().get('worker');

		interactions = [
			SELECT Name, Interview__c, Task__c, DecisionPeriod__c, Decision__c, Amount__c
			FROM Interaction__c
			WHERE Name = :worker
		];
	}

	public PageReference goToMainPage() {
		PageReference page = Page.mainPage;
		page.getParameters().put('role', roleValue);
		page.getParameters().put('tab', 'workers');
		page.setRedirect(true);
		return page;
	}
}