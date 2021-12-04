
function list_remove_item(list, item)

	for index, value in ipairs(list) do

		if value == item then

			table.remove(list, index)

			return index

		end

	end

	return 0

end
