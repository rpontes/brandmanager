module Admin
  class ClientsController < AdminController
    def index
      @clients = Client.sorted_by_name
    end

    def new
      @client = Client.new
    end

    def create
      @client = Client.new(params[:client])

      if @client.save
        redirect_to admin_clients_path,
          :notice => t("flash.clients.create.notice")
      else
        render :new
      end
    end

    def edit
      @client = Client.find(params[:id])
    end

    def update
      @client = Client.find(params[:id])

      if @client.update_attributes(params[:client])
        redirect_to admin_clients_path,
          :notice => t("flash.clients.update.notice")
      else
        render :edit
      end
    end

    def remove
      @client = Client.find(params[:id])
    end

    def destroy
      @client = Client.find(params[:id])
      @client.destroy

      redirect_to admin_clients_path,
        :notice => t("flash.clients.destroy.notice", :name => @client.name)
    end
  end
end
