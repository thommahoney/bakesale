module ProductsHelper
	def current_events
		organizations = current_user.organizations
		Event.where(organization_id: organizations.map(&:id))
	end
end