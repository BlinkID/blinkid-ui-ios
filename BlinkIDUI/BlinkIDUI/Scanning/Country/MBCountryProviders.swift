//
//  MBCountryProvider.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 27/09/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

/// Class describing a country document provider.
/// Contains general document providers by default.
@objc public class MBCountryProvider: NSObject {
    
    /// All document providers as a dictionary of MBDocumentType as keys
    /// and MBDocumentProvider as values.
    var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var documentProviders = [MBDocumentType: MBDocumentProvider]()
        if let passportProvider = passportProvider {
            documentProviders[MBDocumentType.passport] = passportProvider
        }
        if let visaProvider = visaProvider {
            documentProviders[MBDocumentType.visa] = visaProvider
        }
        if let identityCardProvider = identityCardProvider {
            documentProviders[MBDocumentType.identityCard] = identityCardProvider
        }
        if let driversLicenseProvider = driversLicenseProvider {
            documentProviders[MBDocumentType.driverLicense] = driversLicenseProvider
        }
        if let residencePermitProvider = residencePermitProvider {
            documentProviders[MBDocumentType.residencePermit] = residencePermitProvider
        }
        return documentProviders
    }
    /// Driver's license document provider
    var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
    
    /// Identity card document provider
    var identityCardProvider: MBDocumentProvider? {
        return MBIDDocumentProvider()
    }

    /// Passport document provider
    var passportProvider: MBDocumentProvider? {
        return MBPassportDocumentProvider()
    }

    /// Residence permit document provider
    var residencePermitProvider: MBDocumentProvider? {
        return MBResidencePermitDocumentProvider()
    }
    
    /// Visa document provider
    var visaProvider: MBDocumentProvider? {
        return MBVisaDocumentProvider()
    }
    
    /// Array of supported document providers by this country
    public var supportedDocuments: [MBDocumentType] {
        return Array(documentProviders.keys).sorted()
    }
}

class MBDefaultCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
}

class MBAustraliaCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return nil
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
}

class MBAustriaCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBAustriaDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBAustriaIDDocumentProvider()
    }
    
    override var passportProvider: MBDocumentProvider? {
        return MBAustriaPassportDocumentProvider()
    }
}

class MBBruneiCountryProvider: MBCountryProvider {
    override var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var documentProviders = super.documentProviders
        documentProviders[.temporaryResidencePermit] = MBBruneiTemporaryResidencePermitDocumentProvider()
        return documentProviders
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBBruneiIDDocumentProvider()
    }
    
    override var residencePermitProvider: MBDocumentProvider? {
        return MBBruneiResidencePermitDocumentProvider()
    }
}

class MBCanadaCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBCanadaDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBCanadaIDDocumentProvider()
    }
}

class MBColombiaCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBColombiaDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBColombiaIDDocumentProvider()
    }
}

class MBCroatiaCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBCroatiaIDDocumentProvider()
    }
}

class MBCyprusCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBCyprusIDDocumentProvider()
    }
    
    override var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var providers = super.documentProviders
        providers[MBDocumentType.oldID] = MBCyprusIDOldDocumentProvider()
        return providers
    }
}

class MBCzechCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBCzechIDDocumentProvider()
    }
    
    override var residencePermitProvider: MBDocumentProvider? {
        return MBResidencePermitDocumentProvider()
    }

    override var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var providers = super.documentProviders
        providers[MBDocumentType.oldID] = MBCzechIDOldDocumentProvider()
        return providers
    }
}

class MBDenmarkCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return nil
    }
}

class MBEgyptCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBEgyptIDDocumentProvider()
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
}

class MBFranceCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBIDWithMrtdDetectorD1DocumentProvider(isFullySupported: false)
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
}

class MBGermanyCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBGermanyDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBGermanyIDDocumentProvider()
    }

    override var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var providers = super.documentProviders
        providers[MBDocumentType.oldID] = MBGermanyIDOldDocumentProvider()
        return providers
    }
}

class MBHongKongCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBHongKongIDDocumentProvider()
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
}

class MBIndonesiaCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBIndonesiaIDDocumentProvider()
    }
}

class MBIrelandCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBIrelandDLDocumentProvider()
    }
}

class MBItalyCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBItalyDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBIDWithMrtdDetectorD1DocumentProvider(isFullySupported: false)
    }
}

class MBJordanCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBJordanIDOldDocumentProvider()
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
    
    override var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var providers = super.documentProviders
        providers[MBDocumentType.newID] = MBJordanIDDocumentProvider()
        return providers
    }
}

class MBKuwaitCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBKuwaitIDDocumentProvider()
    }
}

class MBMalaysiaCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return nil
    }
    
    override var residencePermitProvider: MBDocumentProvider? {
        return nil
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBMalayasiaDLDocumentProvider()
    }
    
    override var passportProvider: MBDocumentProvider? {
        return MBMalaysiaPassportDocumentProvider()
    }
    
    override var documentProviders: [MBDocumentType: MBDocumentProvider] {
        var providers = super.documentProviders
        providers[MBDocumentType.malaysianID] = MBMalaysiaIDDocumentProvider()
        providers[MBDocumentType.immigratorID] = MBMalayasiaiKadDocumentProvider()
        providers[MBDocumentType.militaryID] = MBMalayasiaMyTenteraDocumentProvider()
        providers[MBDocumentType.permanentResidentID] = MBMalaysiaMyPrDocumentProvider()
        providers[MBDocumentType.temporaryResidentID] = MBMalaysiaMyKasDocumentProvider()
        return providers
    }
}

class MBMexicoCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBMexicoIDDocumentProvider()
    }
}

class MBMoroccoCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBMoroccoIDDocumentProvider()
    }
}

class MBNigeriaCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBNigeriaDLDocumentProvider()
    }
}

class MBNewZealandCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBIDDocumentProvider(isFullySupported: false)
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBNewZealandDLDocumentProvider()
    }
}

class MBPolandCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBPolandIDDocumentProvider()
    }
}

class MBQatarCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBIDWithDetectorD1DocumentProvider(isFullySupported: false)
    }
}

class MBRomaniaCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBRomaniaIDDocumentProvider()
    }
    
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBDLDocumentProvider(isFullySupported: false)
    }
}

class MBSingaporeCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBSingaporeDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBSingaporeIDDocumentProvider()
    }
}

class MBSlovakCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBSlovakiaIDDocumentProvider()
    }
}

class MBSloveniaCountryProvider: MBCountryProvider {
    override var identityCardProvider: MBDocumentProvider? {
        return MBSloveniaIDDocumentProvider()
    }
}

class MBSouthAfricaCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBSouthAfricaDLDocumentProvider(isFullySupported: false)
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBSouthAfricaIDDocumentProvider()
    }
    
    override var visaProvider: MBDocumentProvider? {
        return MBSouthAfricaVisaDocumentProvider(isFullySupported: false)
    }
}

class MBSpainCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBSpainDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBIDDocumentProvider(isFullySupported: false)
    }
    
    override var residencePermitProvider: MBDocumentProvider? {
        return MBResidencePermitDocumentProvider(isFullySupported: false)
    }
}

class MBSwedenCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBSwedenDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBIDDocumentProvider(isFullySupported: false)
    }
    
    override var residencePermitProvider: MBDocumentProvider? {
        return MBResidencePermitDocumentProvider(isFullySupported: false)
    }
}

class MBSwitzerlandCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBSwitzerlandDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBSwitzerlandIDDocumentProvider()
    }
    
    override var passportProvider: MBDocumentProvider? {
        return MBSwitzerlandPassportDocumentProvider()
    }
}

class MBUAECountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBUAEDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBUAEIDDocumentProvider()
    }
    
    override var residencePermitProvider: MBDocumentProvider? {
        return MBUAEResidencePermitDocumentProvider(isFullySupported: false)
    }
    
    override var visaProvider: MBDocumentProvider? {
        return MBUAEVisaDocumentProvider(isFullySupported: false)
    }
}

class MBUKCountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBUKDLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return nil
    }
}

class MBUSACountryProvider: MBCountryProvider {
    override var driversLicenseProvider: MBDocumentProvider? {
        return MBUSADLDocumentProvider()
    }
    
    override var identityCardProvider: MBDocumentProvider? {
        return MBUSAIDDocumentProvider()
    }
}
