L = LANG.GetLanguageTableReference("english")

L[SWAPPER.name] = "Swapper"
L["info_popup_" .. SWAPPER.name] = [[You are a Swapper!
Try to get yourself killed and swap roles!]]
L["body_found_" .. SWAPPER.abbr] = "They were a Swapper."
L["search_role_" .. SWAPPER.abbr] = "This person was a Swapper!"
L["target_" .. SWAPPER.name] = "Swapper"
L["ttt2_desc_" .. SWAPPER.name] = [[The Swapper is in no Team by default. He will switch his Role with his killer!]]
L["ttt2_swapper_revivereason"] = "Swapping roles.."
