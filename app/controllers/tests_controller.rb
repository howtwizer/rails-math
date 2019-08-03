class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @tests = Test.all
    @test      = Test.new
    case ['mult', 'add'].sample
    when 'mult'
      @test.multiplex_and_devide
    when 'add'
      @test.addition_and_substraction
    end
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params).save

    redirect_to action: "new"

    # if @test.save
    #  redirect_to action: "new"
    # else
    #   redirect_to action: "new"
    # end

    # respond_to do |format|
    #   if @test.save
    #     redirect_to action: "index"
    #     # format.html { redirect_to index, notice: 'Test was successfully created.' }
    #     format.json { render :show, status: :created, location: @test }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @test.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
    Test.all.destroy_all
    redirect_to action: "index"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_params
    params.require(:test).permit(:a, :b, :result, :sign, :right)
  end
end
