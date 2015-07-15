class TimeTablesController < ApplicationController
  def new
  end

  def create
     @time_table = TimeTable.new(params[:time_table])

     respond_to do |format|
      if @time_table.save
        format.html  { redirect_to(@time_table,
                      :notice => 'Time-table was successfully created.') }
        format.json  { render :json => @time_table,
                      :status => :created, :location => @time_table }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @time_table.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def index
    @time_tables = TimeTable.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @time_tables }
    end
  end

  def show
    @time_table = TimeTable.find(params[:id])

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @time_table }
    end
  end
end
