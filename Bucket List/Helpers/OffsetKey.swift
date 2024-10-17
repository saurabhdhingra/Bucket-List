import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFLoat = 0
    static func reduce(value: inout CGFLoat, nextValue: () -> CGFloat) {
        value = nextValue() 
    }
}