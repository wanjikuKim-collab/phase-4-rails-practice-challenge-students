class StudentsController < ApplicationController
    def index
        render json: Student.all,status: :ok
    end

    def show
        student = Student.find(params[:id])
        render json: student, status: :ok
    end

    def create
        instructor = Instructor.find(params[:id])
        student = instructor.students.create!(student_params)
        render json: student, status: :created
    end

    def update
        instructor = Instructor.find(params[:id])
        student = instructor.students.find(params[:id])
        student.update!(student_params)
        render json: student, status: :accepted
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age)
    end
end
