require "rails_helper"

RSpec.describe TimeTablesController, :type => :controller do

  describe "GET #index" do
    it "shows all time-tables" do
      tt1 = FactoryGirl.create(:time_table)
      tt2 = FactoryGirl.create(:time_table)
      get :index
      expect(assigns(:time_tables)).to eq([tt1,tt2])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:tt) { FactoryGirl.build_stubbed(:time_table) }
    before do
      TimeTable.stub(:find) { tt }
    end

    it "assigns the requested time-table to @time_table" do
      get :show, id: tt.id
      expect(assigns(:time_table)).to eq(tt)
    end

    it "renders the :show template" do
      get :show, id: tt.id
      expect(response).to render_template(:show)
      expect(response.code).to eq('200')
    end
  end

  describe "GET #edit" do
    let(:tt) { FactoryGirl.build_stubbed(:time_table) }
    before do
      TimeTable.stub(:find) { tt }
    end

    it "assigns the requested time-table to @time_table" do
      get :edit, id: tt.id
      expect(assigns(:time_table)).to eq(tt)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new time-table in the database" do
        expect{
          post :create, time_table: FactoryGirl.attributes_for(:time_table)
        }.to change(TimeTable, :count).by(1)
      end

      it "redirects to the new time-table" do
        post :create, time_table: FactoryGirl.attributes_for(:time_table)
        expect(response).to redirect_to TimeTable.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new time-table in the database" do
        expect{
          post :create, time_table: FactoryGirl.attributes_for(:invalid_time_table)
        }.to_not change(TimeTable, :count)
      end
      it "re-renders the :new template" do
        post :create, time_table: FactoryGirl.attributes_for(:invalid_time_table)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT update" do
    before :each do
      @time_table = FactoryGirl.create(:time_table,
        from: 'Sofia', to: 'Samokov', time: Time.now, transport: 'Bus')
    end

    context "with valid attributes" do
      it "locates the requested @time_table" do
        put :update, id: @time_table, time_table: FactoryGirl.attributes_for(:time_table)
        expect(assigns(:time_table)).to eq(@time_table)
      end

      it "changes @time_table's attributes" do
        put :update, id: @time_table,
          time_table: FactoryGirl.attributes_for(:time_table,
            from: 'Plovdiv',
            to: 'Sofia',
            transport: 'Train')

        @time_table.reload

        expect(@time_table.from).to eq('Plovdiv')
        expect(@time_table.to).to eq('Sofia')
        expect(@time_table.transport).to eq('Train')
      end
    end

    context "with invalid attributes" do
      it "locates the requested @time_table" do
        put :update, id: @time_table, time_table: FactoryGirl.attributes_for(:invalid_time_table)
        expect(assigns(:time_table)).to eq(@time_table)
      end

      it "does not change @time_table's attributes" do
        put :update, id: @time_table,
          time_table: FactoryGirl.attributes_for(:time_table,
            from: nil,
            to: 'Varna',
            transport: 'Train')

        @time_table.reload

        expect(@time_table.from).to eq('Sofia')
        expect(@time_table.to).to_not eq('Varna')
        expect(@time_table.transport).to_not eq('Train')
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @time_table = FactoryGirl.create(:time_table)
    end

    it "deletes the time-table" do
      expect{
        delete :destroy, id: @time_table
      }.to change(TimeTable, :count).by(-1)
    end

    it "redirects to time_tables#index" do
      delete :destroy, id: @time_table
      expect(response).to redirect_to time_tables_url
    end
  end
end
