L = LANG.GetLanguageTableReference("deutsch")

L[SWAPPER.name] = "Tauscher"
L["info_popup_" .. SWAPPER.name] = [[Du bist ein Tauscher!
Versuche getötet zu werden, um deine Rolle zu tauschen!]]
L["body_found_" .. SWAPPER.abbr] = "Er war ein Tauscher."
L["search_role_" .. SWAPPER.abbr] = "Diese Person war ein Tauscher!"
L["target_" .. SWAPPER.name] = "Tauscher"
L["ttt2_desc_" .. SWAPPER.name] = [[Der Tauscher hat kein Team. Er tauscht die Rolle mit seinem Killer!]]
L["ttt2_swapper_revivereason"] = "Tausche Rollen.."
