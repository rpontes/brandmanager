class BrandFilter
  ALL = "all"

  def self.filter(params, scope = Brand.scoped)
    # ActiveRecord::Relation
    scope = scope
      .includes(:user)
      .recent
      .paginate(params[:page])
      # .(all|first|last|each)

    # ActiveRecord::Relation
    #scope = scope.unanswered if params[:filter] == UNANSWERED

    scope
  end
end
