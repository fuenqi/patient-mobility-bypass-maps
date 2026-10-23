# Active Bypassing in Swiss Hospital Care

Interactive maps and methodological documentation for a revealed-choice measure of cross-canton hospital bypassing in Switzerland.

> **Open the interactive maps through GitHub Pages.** GitHub does not preview the source of large self-contained HTML files. This does **not** mean that a map is empty or missing.

| Admission group | Interactive map |
| --- | --- |
| Elective admissions | [Open the interactive map](https://fuenqi.github.io/patient-mobility-bypass-maps/Map_Choropleth_Elective_Leaflet.html) |
| Urgent admissions | [Open the interactive map](https://fuenqi.github.io/patient-mobility-bypass-maps/Map_Choropleth_Urgent_Leaflet.html) |

## Map previews

### Elective admissions

<img width="960" alt="Elective-admissions bypassing map preview" src="https://github.com/user-attachments/assets/f62c8f19-fb6e-486a-9038-9c11ac770eba" />

### Urgent admissions

<img width="960" alt="Urgent-admissions bypassing map preview" src="https://github.com/user-attachments/assets/abd9094a-6bcf-45d5-9076-786f42553ca9" />

*The previews show the initial year. Use the year selector, zoom controls, and pop-ups in the interactive maps above.*

## How Active Bypassing is measured

The measure uses a **revealed behavioral benchmark**, not a mechanically assigned nearest hospital. For every MedStat region *r*, year *t*, and detailed SPLG category *g*, it identifies the shortest observed travel time among patients who reside and are admitted in the same canton:

$$
m_{rtg}=\min_{j:R_j=r,\,T_j=t,\,G_j=g,\,H_j=K_j}d_j
$$

A patient *i* is an Active Bypasser when the patient is admitted outside the home canton and either no in-canton pathway is observed for the relevant cell or the realized journey is longer than the revealed in-canton benchmark:

$$
B_i=\mathbb{1}(H_i\ne K_i)\cdot\mathbb{1}\left[m_{R_iT_iG_i}\text{ is missing}\;\lor\;d_i>m_{R_iT_iG_i}\right]
$$

```mermaid
flowchart LR
    A[All eligible admissions<br/>including walk-in cases] --> B[MedStat region × year × SPLG]
    B --> C[Shortest observed in-canton travel time]
    C --> D{Out-of-canton admission?}
    D -->|No| E[Non-bypassing]
    D -->|Yes| F{No observed in-canton path<br/>or longer travel time?}
    F -->|No| E
    F -->|Yes| G[Active Bypassing]
    E --> H[Aggregate by region, year, and admission group]
    G --> H
    H --> I[Interactive maps]
```

The reference benchmark includes all eligible admissions, including self-referral and walk-in cases. Self-referral cases are excluded only from the final urgent-admission analysis sample. Classification is performed at the detailed SPLG level; Basic Package (BP) and Non-BP categories are reporting aggregates in the maps.

## Data availability

The underlying BFS hospital microdata are confidential and are not distributed with this repository. This repository contains only interactive maps based on region-year aggregates, a simplified map-rendering template, and methodological documentation. It contains no patient-level records, source data, Excel workbooks, or intermediate analysis files.

## Repository contents

| Location | Contents |
| --- | --- |
| `docs/` | Interactive Leaflet maps and the GitHub Pages entry page |
| `code/` | Simplified, path-free template showing map rendering logic |
| `data/README.md` | Data-access and confidentiality statement |

## Citation

Please cite the repository version or release used in your work. A DOI will be added after the first archived release.
