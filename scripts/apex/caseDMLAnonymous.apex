// insert 205 cases
List<Case> listc= new List<Case>();
for (Integer i = 0; i < 205; i++) {
    case c= new Case();
    c.Subject='There is a bug';
    c.Description='Resolve it';
    c.Status='New';
    c.Origin='Web';
    listc.add(c);
}
insert listc;

List<Case> listCase= [select id, status from case where status='Working'];
for (Case c : listCase) {
    c.Status='New';
}
update listCase;