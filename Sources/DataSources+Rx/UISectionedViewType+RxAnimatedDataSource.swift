//
//  UISectionedViewType+RxAnimatedDataSource.swift
//  RxExample
//
//  Created by Krunoslav Zaher on 11/14/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

extension UITableView {
    @available(*, deprecated:0.7, renamed:"rx_itemsWithDataSource", message:"You can just use normal `rx_itemsWithDataSource` extension.")
    public func rx_itemsAnimatedWithDataSource<
            DataSource: RxTableViewDataSourceType & UITableViewDataSource,
            S: Sequence,
            O: ObservableType>
        (_ dataSource: DataSource)
        -> (_ source: O)
        -> Disposable
        where
            DataSource.Element == S,
            O.E == S,
            S.Iterator.Element: AnimatableSectionModelType
         {
        return  { source in
            return self.rx.items(dataSource: dataSource)(source)
        }
    }
}

extension UICollectionView {
    @available(*, deprecated:0.7, renamed:"rx_itemsWithDataSource", message:"You can just use normal `rx_itemsWithDataSource` extension.")
    public func rx_itemsAnimatedWithDataSource<
            DataSource: RxCollectionViewDataSourceType & UICollectionViewDataSource,
            S: Sequence,
            O: ObservableType>
        (_ dataSource: DataSource)
        -> (_ source: O)
        -> Disposable
        where
            DataSource.Element == S,
            O.E == S,
            S.Iterator.Element: AnimatableSectionModelType
         {
        return { source in
            return self.rx.items(dataSource: dataSource)(source)
        }
    }
}
