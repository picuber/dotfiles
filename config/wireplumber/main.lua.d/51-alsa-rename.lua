table.insert(alsa_monitor.rules, {
    matches = {
        {
            { "device.name", "equals", "alsa_card.pci-0000_06_00.1"},
        },
    },
    apply_properties = {
        ["device.description"] = "HDMI Audio"
    }
})
table.insert(alsa_monitor.rules, {
    matches = {
        {
            { "device.name", "equals", "alsa_card.pci-0000_06_00.6"},
        },
    },
    apply_properties = {
        ["device.description"] = "Laptop Audio"
    }
})
