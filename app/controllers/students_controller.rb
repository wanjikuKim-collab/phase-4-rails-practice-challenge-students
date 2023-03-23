class StudentsController < ApplicationController
    def index
        render json: Student.all,status: :ok
    end

    def show
        student = Student.find_student
        render json: student, status: :ok
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find_student
        student.update!(student_params)
        render json: student, status: :accepted
    end

    def destroy
        student = Student.find_student
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        student = Student.find(params[:id])
    end
end
