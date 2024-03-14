SoqlVideo.allContacts();
SoqlVideo.latestContact();
SoqlVideo.contactEmail();
SoqlVideo.contact('Josh');

 public static void createTask(){
            list<task> listTask= new List<task>();
            // assigned to ,  status,  subject and priority
            task t= new task();
            t.ownerId = '005Hn00000HBfszIAD';
            t.status= 'in Progress';
            t.Subject= 'Call';
            t.Priority='Normal';
            t.Description='It will be done today';
            
            listTask.add(t);
 }