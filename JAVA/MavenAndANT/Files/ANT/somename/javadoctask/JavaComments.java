/**
 * This program will demonstrate the use of java comments
 *
 * @author Yourname
 * @version 2.0
 */
public class JavaComments {

    //x and y are variables and are initialized here.
    //http://www.oracle.com/technetwork/articles/java/index-137868.html
    int x = 10;
    int y = 20;

    //Single Line Comment. This line wont be compiled. This is for the benifit of the programmer to understnad your code.
    /*
    Multi-line comment. This is an example of multiline commnet.
    These lines wont be compiled. This is for the benifit of the programmer to understnad your code.
     */
    /**
     * <b>This method is used to add two integers.</b>
     *
     * @param a This is the first parameter
     * @param b This is the second parameter
     * @return int This returns sum of a and b.
     */
    public int addition(int a, int b) {
		
        return a + b;
    }
}
