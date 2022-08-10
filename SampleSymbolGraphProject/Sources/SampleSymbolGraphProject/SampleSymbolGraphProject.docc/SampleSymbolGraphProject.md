# ``SampleSymbolGraphProject``

This project demonstrates how extensions to external types can be documented and how this documentation behaves in tricky cases.

## Overview

Important topics are collisions, synthesized members, link-stability, documentation-stability, availability, cross-module nested type extensions, reference resolution, and DocC's documentation adaption capabilities.

The project consists of six modules, this ``/SampleSymbolGraphProject``, ``/A``, ``/B``, ``/C``, ``/D``, and ``/E``. All important symbols are linked on this page.

## Topics

### Collisions

Module ``C`` tests a basic collision on ``C/A/AProtocol`` between ``C/A/AProtocol/bar(val:)-36e1l`` and ``C/A/AProtocol/bar(val:)-5houi``. Module ``D`` tests a collision across a typealias on ``D/A/AProtocol`` between ``D/A/AProtocol/dbar()-7y3a`` and ``D/A/AProtocol/dbar()-8y0xc``. Module ``E`` tests a collision between extensions to nested types that have the same names on ``E/A/AStruct2`` and its various `Inner` types. Module ``SampleSymbolGraphProject`` tests type-kind based collision resolution by colliding ``b-swift.var`` and ``SampleSymbolGraphProject/B-swift.module.extension``. 
- ``C/A/AProtocol``
- ``D/A/AProtocol``

- ``E/A/AStruct2``
- ``E/A/Inner-7jmlb``
- ``E/A/Inner-3iooq``
- ``E/A/Inner-6cqre``

- ``b-swift.var``
- ``SampleSymbolGraphProject/B-swift.module.extension``

### Synthesized Members

Modules ``/C`` and ``/D`` extend ``/B/BProtocol`` with functions ``/C/B/BProtocol/bar()`` and ``/D/B/BProtocol/bar()``, respectively. Module ``/E``, where both C and D are imported, conforms ``/A/AStruct`` to ``/B/BProtocol``. Thus, ``/E/A/AStruct``'s synthesized members ``/E/A/AStruct/bar()-8oh05`` and ``/E/A/AStruct/bar()-14k9g`` collide in E.
- ``/E/A/AStruct``
- ``/E/A/AStruct/bar()-8oh05``
- ``/E/A/AStruct/bar()-14k9g``

### Link-Stability

Since the Extended Type Symbols Format Transformation combines multiple `swift.extension` symbols into one `swift.TYPE_KIND.extension` symbol, we have to make sure the transformation always chooses the same `swift.extension` symbol (and its precise identifier) as a basis. There exists a collision between the following symbols, which would make a change in the precise identifier visible.

- ``B/A/AStruct-3827z``
- ``B/A/AStruct-5oj03``

### Documentation-Stability

Similarly to link-stability, the fact that extended type symbols are synthesized from multiple extension block symbols also means that the documentation comment on extended type symbols must be selected from one of the extension block symbols. It chooses the comment with the highest number of lines, however, if there is no clear winner, the chosen comment should not change after recompiling. The documentation for ``B/A/AStruct-3827z`` should always remain "1". The candidate extension block symbols are those defining the following properties:

- ``B/A/AStruct-3827z/bBar1()``
- ``B/A/AStruct-3827z/bBar2()``

### Availability

``SampleSymbolGraphProject`` extends some ``SwiftUI`` types to demonstrate compatibility with availablity annotations. 

- ``SwiftUI/View``
- ``SwiftUI/Color``

### Cross-Module Nested Type Extensions

In module ``/C`` we extend ``/B/A/AStruct-3827z/BStruct`` with ``/C/B/BStruct/CStruct``. The respective extension ``/C/B/BStruct`` is considered an extension to module ``/B``, even though ``/B/A/AStruct-3827z/BStruct`` is a member of a type in module ``/A``.
- ``/C/B/BStruct``
- ``/C/B/BStruct/CStruct``

### Reference Resolution

We can link to ``SampleSymbolGraphProject/A`` (`SampleSymbolGraphProject/A`), and ``/A`` (`/A`). The shorthand `A` (``A``) follows the "local-first" guideline proposed in the forums discussion, i.e. it resolves to ``SampleSymbolGraphProject/A``.
- ``A``

### Adapting Documentation

This page already makes heavy use of referencing symbols and manual curation. The following symbols were extended:

- ``SampleSymbolGraphProject/SwiftUI``
- ``B/A/AStruct-3827z/BStruct``
- ``/B/A/AStruct6``

### Default Implementations on External Protocols

One feature not implemented yet are default implementations on external protocols. This will require small modifications to apple/swift and apple/swift-docc beyond [apple/swift#59047](https://github.com/apple/swift/pull/59047) and [apple/swift-docc#335](https://github.com/apple/swift-docc/pull/335). This documentation archive already contains a default implementation for ``/A/AProtocolWithRequirement/aFoo()``, which is provided by ``SampleSymbolGraphProject/A/AProtocolWithRequirement``. In this archive, the default implementation is directly associated with ``/A/AProtocolWithRequirement``, which shouldn't be the case. In regular archives that only contain one module, the default implementation would just not be visible at all at the moment.

- ``/A/AProtocolWithRequirement``
- ``SampleSymbolGraphProject/A/AProtocolWithRequirement``
- ``/A/AProtocolWithRequirement/aFoo()``
- ``SampleSymbolGraphProject/A/AProtocolWithRequirement/aFoo()``
