debug_print("Window Name: " ..	get_window_name());
debug_print("Application name: " .. get_application_name())


if (string.find(get_application_name(),"Vim")~=nil) then
    maximize()
    undecorate_window()
end

if (string.find(get_application_name(),"Slack")~=nil) then
    maximize()
    undecorate_window()
end

if (string.find(get_application_name(),"Joplin")~=nil) then
    maximize()
    undecorate_window()
end
