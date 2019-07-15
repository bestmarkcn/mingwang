<?php
class ModelNewsNewsType extends Model {
	public function addNewsType($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news_type SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$news_type_id = $this->db->getLastId(); 

		foreach ($data['news_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_description SET news_type_id = '" . (int)$news_type_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['news_type_store'])) {
			foreach ($data['news_type_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_to_store SET news_type_id = '" . (int)$news_type_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['news_type_layout'])) {
			foreach ($data['news_type_layout'] as $store_id => $layout) {
				if ($layout) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_to_layout SET news_type_id = '" . (int)$news_type_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_type_id=" . (int)$news_type_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('news_type');
	}

	public function editNewsType($news_type_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news_type SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE news_type_id = '" . (int)$news_type_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_description WHERE news_type_id = '" . (int)$news_type_id . "'");

		foreach ($data['news_type_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_description SET news_type_id = '" . (int)$news_type_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_to_store WHERE news_type_id = '" . (int)$news_type_id . "'");

		if (isset($data['news_type_store'])) {
			foreach ($data['news_type_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_to_store SET news_type_id = '" . (int)$news_type_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_to_layout WHERE news_type_id = '" . (int)$news_type_id . "'");

		if (isset($data['news_type_layout'])) {
			foreach ($data['news_type_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "news_type_to_layout SET news_type_id = '" . (int)$news_type_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_type_id=" . (int)$news_type_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_type_id=" . (int)$news_type_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('news_type');
	}

	public function deleteNewsType($news_type_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type WHERE news_type_id = '" . (int)$news_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_description WHERE news_type_id = '" . (int)$news_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_to_store WHERE news_type_id = '" . (int)$news_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_type_to_layout WHERE news_type_id = '" . (int)$news_type_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_type_id=" . (int)$news_type_id . "'");

		$this->cache->delete('news_type');
	}	

	public function getNewsType($news_type_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_type_id=" . (int)$news_type_id . "') AS keyword FROM " . DB_PREFIX . "news_type WHERE news_type_id = '" . (int)$news_type_id . "'");

		return $query->row;
	}

	public function getNewsTypes($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "news_type i LEFT JOIN " . DB_PREFIX . "news_type_description id ON (i.news_type_id = id.news_type_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.sort_order'
			);		

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY id.title";	
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$news_type_data = $this->cache->get('news_type.' . (int)$this->config->get('config_language_id'));

			if (!$news_type_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_type i LEFT JOIN " . DB_PREFIX . "news_type_description id ON (i.news_type_id = id.news_type_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$news_type_data = $query->rows;

				$this->cache->set('news_type.' . (int)$this->config->get('config_language_id'), $news_type_data);
			}	

			return $news_type_data;			
		}
	}

	public function getNewsTypeDescriptions($news_type_id) {
		$news_type_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_type_description WHERE news_type_id = '" . (int)$news_type_id . "'");

		foreach ($query->rows as $result) {
			$news_type_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				'description' => $result['description']
			);
		}

		return $news_type_description_data;
	}

	public function getNewsTypeStores($news_type_id) {
		$news_type_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_type_to_store WHERE news_type_id = '" . (int)$news_type_id . "'");

		foreach ($query->rows as $result) {
			$news_type_store_data[] = $result['store_id'];
		}

		return $news_type_store_data;
	}

 

	public function getTotalNewsTypes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_type");

		return $query->row['total'];
	}	

	public function getTotalNewsTypesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_type_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
?>