<?php
declare(strict_types=1);

$site_title = 'My Cookbook';

// Sample recipes to search through
$recipes = [
  'Ancho-Orange Chicken',
  'Beef Medallions & Mushroom Sauce',
  'Broccoli & Basil Pesto Sandwiches',
  'Broccoli & Mozzarella Calzones',
  'Bucatini Alfredo',
  'Bucatini & Tomato Sauce',
  'Cheesy Enchiladas Rojas',
  'Crispy Fish Sandwiches',
  'General Tso Chicken',
  'Hoisin-Glazed Pork Chops',
  'Honey-Butter Barramundi',
  'Kale & Ricotta Quiche',
  'Mexican-Spiced Barramundi',
  'Mushroom & Potato Tacos',
  'Parmesan-Crusted Chicken',
  'Pimento Cheeseburgers',
  'Pork Chorizo Tacos',
  'Roasted Broccoli & Fregola Sarda Salad',
  'Roasted Brussels Sprout & Freekeh Salad',
  'Roasted Cauliflower Salad',
  'Roasted Chicken & Fall Vegetables',
  'Roasted Pork & Broccoli',
  'Roasted Red Pepper Pasta',
  'Roasted Squash Curry',
  'Roasted Turkey Breast & Farro- Endive Salad',
  'Salmon & Honey-Glazed Carrots',
  'Seared Chicken & Mashed Potatoes',
  'Seared Steaks & Garlic Butter',
  'Shiitake & Hoisin Beef Burgers',
  'Shrimp Fra Diavolo',
  'Smoked Gouda & Mushroom Flatbread',
  'Spicy Chicken Quesadillas',
  'Spicy Pork & Korean Rice Cakes',
  'Sweet & Sour Vegetable Stir-Fry',
  'Thai Curry Chicken',
  'Tilapia & Black Lentil Salad',
  'Togarashi Chicken Lettuce Cups',
  'Top Chef Ginger-Marinated Grassfed Steaks',
  'Top Chef Seared Grassfed Steaks',
  'Tuscan Chicken & Green Lentil Stew',
];

// GET form handling
$query = '';
$results = [];
$searched = false;
$error = '';

if (isset($_GET['q'])) {
  $query = trim($_GET['q']);

  if ($query === '') {
    $error = 'Please enter a search term.';
  } else {
    $searched = true;
    foreach ($recipes as $recipe) {
      if (str_contains(strtolower($recipe), strtolower($query))) {
        $results[] = $recipe;
      }
    }
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($site_title) ?></title>
</head>
<body>
  <h1><?= htmlspecialchars($site_title) ?></h1>
  <p>Using PHP for this site. Yay!</p>

  <h2>Search recipes</h2>
  <form action="index.php" method="get">
    <label for="q">Recipe name contains</label>
    <input type="search" id="q" name="q" value="<?= htmlspecialchars($query) ?>">
    <button type="submit">Search</button>
  </form>

  <?php if ($error !== '') : ?>
    <p><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <?php if ($searched) : ?>
    <p><?= htmlspecialchars((string) count($results)) ?> result(s) for "<?= htmlspecialchars($query) ?>"</p>
    <ul>
      <?php foreach ($results as $recipe) : ?>
        <li><?= htmlspecialchars($recipe) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>