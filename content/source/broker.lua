
require('source/list')

--

local events = { }

--

function broker_register(name)

	events[name] = events[name] or { }

	return events[name]

end

--

function broker_send(name, payload)

	if events[name] ~= nil then

		for _, callback in ipairs(events[name]) do

			callback(payload)

		end

	end

end

--

function broker_subscribe(name, callback)

	local list = broker_register(name)

	table.insert(list, callback)

	return callback

end

--

function broker_unsubscribe(name, callback)

	if events[name] ~= nil then

		list_remove_item(events[name], callback)

	end

end
