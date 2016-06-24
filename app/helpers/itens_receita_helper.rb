module ItensReceitaHelper

	def link_to_add_item_receita(name, f, association, html_classes)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render("item", item: builder)
		end

		link_to(name, "#", class: "add_item " + html_classes, data: {id: id, fields: fields.gsub("\n", "")})
	end

end
