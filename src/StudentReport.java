public class StudentReport {
    private String studentName;
    private double grade;
    private String feedbackText;

    public StudentReport(String studentName, double grade, String feedbackText) {
        this.studentName = studentName;
        this.grade = grade;
        this.feedbackText = feedbackText;
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