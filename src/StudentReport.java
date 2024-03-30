public class StudentReport {
    private String studentName;
    private double grade;
    private String feedbackText;
    private int courseID;

    public StudentReport(String studentName, double grade, String feedbackText, int courseID) {
        this.studentName = studentName;
        this.grade = grade;
        this.feedbackText = feedbackText;
        this.courseID = courseID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }
}