public class GeneralClass {
    
    public void createstudents(){
        student st = new Student();
        st.name='Phil';
        st.birthdate=Date.newInstance(1987, 1, 9);
        st.schoolName='robinson';
        system.debug(st);

        Student st2 = new Student();

        st2.name ='Jhon';
        st2.birthdate = Date.newInstance(1999, 7, 3);
        st.schoolName='Malalay High school';
        system.debug(st2);
        
    }
    public void any(){
        Integer a = 3+3+3;
        system.debug(a);
    }

    public void stu(){
        Student st = new Student();
    st.name='Jhon';
    st.birthdate=Date.newInstance(1998, 30, 12);
    st.schoolName='Afghan Turk ';
    st.dec();
    }
}