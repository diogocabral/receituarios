module ItensOrientacaoHelper

  def link_to_add_item_orientacao(name, f, association, html_classes)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("item", item: builder)
    end

    link_to(name, "#", class: "add_item " + html_classes, data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_subitem_orientacao(name, f, association, html_classes)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("subitem", subitem: builder)
    end

    link_to(name, "#", class: html_classes, data: {id: id, fields: fields.gsub("\n", "")})
  end

end
