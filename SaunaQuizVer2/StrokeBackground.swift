//
//  StrokeBackground.swift
//  SaunaQuizVer2
//
import SwiftUI

struct StrokeBackground: ViewModifier {
    
    let strokeSize: CGFloat
    let strokeColor: Color
    
    func body(content: Content) -> some View {
        Group {
            if strokeSize > 0 {
                content
                    .padding(strokeSize * 2)
                    .background(strokeView(content: content))
            } else {
                content
            }
        }
    }
    
    private func strokeView(content: Content) -> some View {
        Rectangle()
            .foregroundStyle(strokeColor)
            .mask(
                Canvas { context, size in
                    context.addFilter(.alphaThreshold(min: 0.01))
                    context.drawLayer { ctx in
                        if let resolvedView = context.resolveSymbol(id: "maskView") {
                            ctx.draw(resolvedView, at: .init(x: size.width / 2, y: size.height / 2))
                        }
                    }
                } symbols: {
                    content
                        .tag("maskView")
                        .blur(radius: strokeSize)
                }
            )
    }
}

