class ComponentsController < ApplicationController
    def index
        @components = Component.stock
    end

    def show
    end
end
