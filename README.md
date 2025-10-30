# ACEs and Partner Relationships

## Project Overview
This project explores how **Adverse Childhood Experiences (ACEs)** shape adult relationships, partner choice, and long-term family outcomes. It seeks to investigates the phenomenon of **assortative mating by adversity**—the tendency for individuals with similar ACE histories to form partnerships—and examines how **shared childhood trauma affects relationship quality, mental + physical health, and socioeconomic well-being.**

## Data Source
The data used in this project is drawn from **peer-reviewed journals** mainly from [Plos.org](https://journals.plos.org/plosone/).

The data in the studies was obtained from 818 couples in Sweden.

See ***References*** section for citation details.

## Project Objectives
The project aims to:

**1. Examine assortative mating by adversity**
- Identify patterns of partner similarity in reported Adverse Childhood Experiences (ACEs) and determine whether individuals with specific ACE histories are more likely to pair with partners who share similar experiences. [^1]

**2. Assess the cumulative impact of shared ACE exposure on relationship and family outcomes**
- Compare socioeconomic, emotional, and health outcomes across ACE exposure groups (none, one partner high and both partners high) to determine how shared childhood adversity affects relationship quality and family well-being. [^2]

## Tools & Technologies Used
A hybrid approach integrated **SQL’s efficiency** in data extraction, schema design, and structured data management with **Python’s powerful statistical analysis** and **rich visualization** capabilities, delivering a workflow that was both efficient and insight-driven.
- **PostgreSQL**: Schema design and initial data analysis using SQL.
- **Python**: Main programming language used.
  - **SQLAlchemy + psycopg2**: For working with SQL databases directly within Python; database connection and analysis queries.
  - **Pandas**: For analyzing data and visualization Integration.
  - **Matplotlib**: For creating basic charts and graphs.
  - **Seaborn**: For more advanced and visually appealing plots.
- **VS Code**: Integrated Development Environment (IDE) for scripting and data handling.
- **Jupyter Notebooks**: An interactive environment for combining code, text, and visuals in one document.
- **Git & GitHub**: Version control.

## Data Analysis
### 1. Assortative Mating
**Insights**
- Childhood adversity clusters within couples—an early-life echo shaping partner choice.
- Sexual abuse ranks highest in the shared Trauma experienced.
  
![Assortative mating](/visuals/1.assortative_mating.png)
**Figure 1.** Assortative mating in couples sharing the same early-life adversities

### 2. Cumulative impact of shared ACE exposure on relationship and family outcomes
- When both partners carry heavy ACE histories, economic, emotional, and health burdens compound—showing the **cumulative cost** of shared trauma.
- Negative outcomes **steadily rises** from no ACEs experienced to those with more that 4 ACEs in couples.
- **Low education**, followed by **High stress** and low income are the top 3 outcomes. 
- **Dual High Exposure**: Partners who both have experienced high early-life traumas (ACE >=4) result in a relationship and family dynamic of **high stress** and **socioeconomic disadvantage** of low education and income. (Figure 3)
  
![Cumulative outcomes](/visuals/2.cummulative_outcomes.png)
**Figure 2.** Cumulative outcomes of ACEs in socioeconomic, health and relational quality.

![ACE category group exposure to outcome flow](/visuals/3.ace_category_group_to_outcome_flow.png)

**Figure 3.** ACE category group exposure to outcomes flow.

See [ACEs and Partner Relationships notebook](/notebooks/ACEs_and_Partner_Relationships_notebook.ipynb) for detailed analysis process.

## Conclusion
This project underscores how **Adverse Childhood Experiences (ACEs)** (can) shape adult relationships and family life. When **both partners carry the weight of early adversity, the challenges of economic hardship, emotional strain, and health difficulties often multiply**. Yet, these patterns also highlight opportunity — the chance to break cycles of trauma through awareness, empathy, and support. 

Breaking the cycle of adversity begins with understanding and compassion. Every effort to recognize, discuss, and address the lingering effects of childhood trauma can change the trajectory of a family’s future. By investing in **trauma-informed education, counseling, and community support,** we can **empower individuals and couples to heal together** — turning past pain into strength, and building families grounded in resilience, empathy, and hope.


###  References

[^1]: [Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study"; Table 3.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0244696). ```Andersson SO, Annerbäck EM, Söndergaard HP, Hallqvist J, Kristiansson P (2021) Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study. PLOS ONE 16(1): e0244696.```

[^2]: [Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study"; Table 4.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0244696). ```Andersson SO, Annerbäck EM, Söndergaard HP, Hallqvist J, Kristiansson P (2021) Adverse Childhood Experiences are associated with choice of partner, both partners' relationship and psychosocial health as reported one year after birth of a common child. A cross-sectional study. PLOS ONE 16(1): e0244696.```
